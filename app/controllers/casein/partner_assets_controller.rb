# Scaffolding generated by Casein v5.1.1.5

module Casein
  class PartnerAssetsController < Casein::CaseinController
    before_filter :load_partner_asset, :only => [:show, :update, :destroy]
    ## optional filters for defining usage according to Casein::AdminUser access_levels
    # before_filter :needs_admin, :except => [:action1, :action2]
    # before_filter :needs_admin_or_current_user, :only => [:action1, :action2]
  
    def index
      @casein_page_title = 'Partner assets'
      @partner_assets = PartnerAsset.order(sort_order(:retailer_domain)).paginate :page => params[:page]
      respond_to do |format|
        format.html
        format.csv { send_data @partner_assets.to_csv, filename: "partner_assets-#{Date.today}.csv"}
        format.xlsx
      end
    end
  
    def show
      @casein_page_title = 'View partner asset'
    end
  
    def import
      PartnerAsset.import(params[:file])
      flash[:notice] = 'File has been imported'
      redirect_to casein_partner_assets_path
    end

    def new
      @casein_page_title = 'Add a new partner asset'
      @partner_asset = PartnerAsset.new
    end

    def create
      @partner_asset = PartnerAsset.new partner_asset_params
    
      if @partner_asset.save
        flash[:notice] = 'Partner asset created'
        redirect_to casein_partner_assets_path
      else
        flash.now[:warning] = 'There were problems when trying to create a new partner asset'
        render :action => :new
      end
    end
  
    def update
      @casein_page_title = 'Update partner asset'
      
      respond_to do |format|
        if @partner_asset.update_attributes partner_asset_params
       
          format.html { redirect_to casein_partner_asset_path(@partner_asset), notice: "Partner asset has been updated. #{undo_link}" }
          format.js
        else
          flash.now[:warning] = 'There were problems when trying to update this partner asset'
          render :action => :show
        end
     end
    end
    
    def edit_multiple
      @partner_assets = PartnerAsset.where(id: partner_asset_params[:partner_asset_ids])

      if params[:edit]
        render "partner_assets/edit_multiple"
      elsif params[:unpublish]
        @partner_assets.each do |partner_asset|
          partner_asset.unpublish! if partner_asset.published?
        end
        redirect_to casein_partner_assets_path
      elsif params[:publish]
        @partner_assets.each do |partner_asset|
          partner_asset.publish! if !partner_asset.published?
        end
          redirect_to casein_partner_assets_path
      elsif params[:delete]
          @partner_assets.destroy_all
          redirect_to casein_partner_assets_path
      end
    end

    def update_multiple
     @partner_assets = PartnerAsset.update(params[:partner_assets].keys, params[:partner_assets].values)
      @partner_assets.reject! { |partner_asset| partner_asset.errors.empty? }
      if @partner_assets.empty?
        redirect_to casein_partner_assets_path
      else
        render "partner_assets/edit_multiple"
      end
    end
 
    def destroy

      @partner_asset.destroy
      flash[:notice] = 'Partner asset has been deleted. #{undo_link}"'
      redirect_to casein_partner_assets_path
    end
  
    private
      
      def partner_asset_params
        params.require(:partner_asset).permit(:retailer_domain, :logo_url)
      end
      
      def undo_link
        view_context.link_to("undo", revert_version_path(@partner_asset.versions.last), :method => :post).html_safe
      end
      
      def load_partner_asset
        @partner_asset = PartnerAsset.find params[:id]
      end
  
  end
end
