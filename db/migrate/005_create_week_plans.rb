class CreateWeekPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :week_plans do |t|
      t.string  :dinner
      t.timestamps
    end
  end
end
