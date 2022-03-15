module Api
  module V1
    class BatchesController < ApiController
      protect_from_forgery with: :null_session

      # GET /batches or /batches.json
      def index
        @batches = Batch.all
      end

      # GET /batches/1 or /batches/1.json
      def show
        render plain: @batch.to_json, content_type: 'application/json'
      end

      # GET /batches/new
      def new
        @batch = Batch.new
      end

      # GET /batches/1/edit
      def edit
      end

      # POST /batches or /batches.json
      def create
        @batch = Batch.new(batch_params)

        respond_to do |format|
          if @batch.save
            # format.html { redirect_to batch_url(@batch), notice: "Batch was successfully created." }
            format.json { render :show, status: :created, location: @batch }
          else
            # format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @batch.errors, status: :unprocessable_entity }
          end
        end
      end

      # PATCH/PUT /batches/1 or /batches/1.json
      def update
        respond_to do |format|
          if @batch.update(batch_params)
            # format.html { redirect_to batch_url(@batch), notice: "Batch was successfully updated." }
            format.json { render :show, status: :ok, location: @batch }
          else
            # format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @batch.errors, status: :unprocessable_entity }
          end
        end
      end

      # DELETE /batches/1 or /batches/1.json
      def destroy
        @batch.destroy

        respond_to do |format|
          # format.html { redirect_to batches_url, notice: "Batch was successfully destroyed." }
          format.json { head :no_content }
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_batch
        @batch = Batch.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def batch_params
        params.require(:batch).permit(:producer_id, :store_id, :item_name, :best_by, :exp_date, :recall)
      end
    end
  end
end
