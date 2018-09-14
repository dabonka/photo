class EntriesController < ApplicationController
  include Swagger::Blocks

  def create
    @entry = Entry.new(entry_params)

    if @entry.save!
      render :create
    else
      render json: {message: "Entry was not created"}
    end

    private

    def entry_params
      params.permit(:id, :name, :custom)
  end
end