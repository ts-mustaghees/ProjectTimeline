class CategoriesController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_category, only: [:edit, :update]

    def edit
        respond_to do |format|
            format.js
        end
    end

    def create
        new_cat = Category.new(permitted_params)

        if new_cat.save
            flash[:success] = new_cat.name + ' created!'
        else
            flash[:danger] = new_cat.name + ' could not be created!'
            flash[:danger] += " <strong>#{new_cat.errors.full_messages[0]}</strong>" 
        end

        redirect_to request.referrer
    end
    
    def update
        old_name = @category.name

        if @category.update_attributes(permitted_params)
            flash[:success] = "#{old_name} updated to #{@category.name}"
        else
            flash[:danger] = @category.name + ' could not be updated!'
            flash[:danger] = " <strong>#{@category.errors.full_messages[0]}</strong>"
        end

        redirect_to request.referrer
    end

    def destroy
        category = Category.find(params[:id])

        if category.destroy
            flash[:success] = category.name + ' deleted!'
        else
            flash[:danger] = 'Could not delete. Something went wrong.'
        end

        redirect_to request.referrer
    end

    private
        def set_category
            @category = Category.find_by(id: params[:id])
        end

        def permitted_params
            params.require(:category).permit(:name)
        end
end