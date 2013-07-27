class CreatePunchcards < ActiveRecord::Migration
  def change
    create_table :punchcards do |t|

      t.datetime :punchin
      t.datetime :punchout

      t.timestamps
    end
  end
end
