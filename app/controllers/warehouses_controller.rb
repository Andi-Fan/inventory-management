class WarehousesController < ApplicationController
  def index
    @warehouses = Warehouse.all
  end

  def show
    @warehouse = Warehouse.find(params[:id])
    @products = @warehouse.products
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(location: warehouse_params[:location], postal_code: warehouse_params[:postal_code])
    id_arr = warehouse_params['productIds'].split(';')
    @warehouse.product_ids = id_arr
  
    if @warehouse.save
        redirect_to @warehouse
      else
        render :new, status: :unprocessable_entity
      end
  end

  def edit
    @warehouse = Warehouse.find(params[:id])
    @selected_products = @warehouse.products.ids.join(";")
  end
  
  def update
    @warehouse = Warehouse.find(params[:id])
    id_arr = warehouse_params['productIds'].split(';')
    @warehouse.product_ids = id_arr
    @warehouse.location = warehouse_params[:location]
    @warehouse.postal_code = warehouse_params[:postal_code]

    if @warehouse.save
      redirect_to @warehouse
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @warehouse = Warehouse.find(params[:id])
    @warehouse.destroy

    redirect_to warehouses_path, status: :see_other
  end

  private 
  def warehouse_params
    params.require(:warehouse).permit(:location, :postal_code, :productIds)
  end 
end
