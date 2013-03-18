class <%= plural_class_name %>Controller < ApplicationController

  def new
    @<%= singular_name %> = <%= class_name %>.new
  end

  def index
    @<%= plural_name %> = <%= class_name %>.all
  end
  <% ['show', 'edit'].each do |method|  %>
  def <%= method %>
    @<%=  singular_name %>  = <%= class_name %>.find(params[:id])
  end
  <% end %>
  def create
    @<%= singular_name %> = <%= class_name %>.new(params[:<%= singular_name %>])
    if @<%= singular_name %>.save
      redirect_to <%= singular_name %>_path(@<%= singular_name %>), :notice => "Successfully created <%= display_name %>."
    else
      render :new
    end
  end

  def update
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    if @<%= singular_name %>.update_attributes(params[:<%= singular_name %>])
      redirect_to <%= singular_name %>_path(@<%= singular_name %>), :notice  => "Successfully updated <%= display_name %>."
    else
      render :edit
    end
  end

  def destroy
    @<%= singular_name %> = <%= class_name %>.find(params[:id])
    @<%= singular_name %>.destroy
    flash[:notice] = "Successfully deleted <%= name.underscore.humanize.downcase %>."
    redirect_to <%= plural_name %>_path
  end

end