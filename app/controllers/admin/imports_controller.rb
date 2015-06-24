class Admin::ImportsController < ApplicationController
  skip_load_and_authorize_resource

  def create
    import_csv params[:model].safe_constantize, params[:file]
    redirect_to :back, notice: t("import.success")
  end

  private
  def import_csv model, file
    CSV.foreach(file.path, headers: true) do |row|
      m = model.find_by_id(row["id"]) || model.new
      m.attributes = row.to_hash.slice *row.to_hash.keys
      m.save!
    end
  end
end
