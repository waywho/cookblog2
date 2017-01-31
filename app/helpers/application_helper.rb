module ApplicationHelper
  	def link_to_add_new_fields(name, f, association)
	    new_object = f.object.send(association).klass.new
	    id = new_object.object_id
	    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
	      render(association.to_s.singularize + "_new_fields", :f => builder)
	    end
    	link_to(name, '#', :class => 'add_fields', data: {id: id, fields: fields.gsub("\n", "")})
  	end

  	def state_icon(state)
		"#{state}.png"
	end
	
	def random
		offset(rand(count))
	end
	def rand_recipe(recipes)
		offset_num = rand(recipes.count - 1)
		@rand_feature = recipes.offset(offset_num).first
	end
end
