module Api
  module V1
    class OrdersController < ApiController
      protect_from_forgery with: :null_session

      def index
        @orders = Order.all
      end

      # GET /orders/1 or /orders/1.json
      def show
        render plain: @order.to_json, content_type: 'application/json'
      end

      # GET /orders/new
      def new
        @order = Order.new
        @order.food_items.build
      end

      # GET /orders/1/edit
      def edit
      end

      # POST /orders or /orders.json
      def create
        puts order_params
        @order = Order.new(order_params)

        respond_to do |format|
          if @order.save
            # format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
            format.json { render :show, status: :created, location: @order }
          else
            # format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /orders/1 or /orders/1.json
      def update
        respond_to do |format|
          if @order.update(order_params)
            # format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
            # format.json { render :show, status: :ok, location: @order }
            render json: @order
          else
            # format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /orders/1 or /orders/1.json
      def destroy
        @order.destroy

        respond_to do |format|
          # format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = Order.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def order_params
          params.require(:order).permit(:store_id, food_items_attributes: [:batch_id, :quantity])
        end
    end
  end
end
