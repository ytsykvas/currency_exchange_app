class AddColumnToUahRates < ActiveRecord::Migration[7.0]
  def change
    add_column :uah_rates, :rate, :float
  end
end
