class CreateRaceResults < ActiveRecord::Migration[8.0]
  def change
    create_table :race_results do |t|
      t.integer :race_number
      t.string :card_number
      t.string :membership_number
      t.string :name
      t.string :category
      t.string :club
      t.string :country
      t.string :course_class
      t.datetime :start_time
      t.datetime :finish_time
      t.time :race_time
      t.string :non_competitive
      t.integer :position
      t.string :status
      t.integer :handicap
      t.integer :penalty_score
      t.integer :manual_score_adjust
      t.integer :final_score
      t.time :handicap_time
      t.integer :handicap_score
      t.string :award_level
      t.string :entry_system_ids
      t.string :eligibility
      t.time :journey_time
      t.time :excluded_excess
      t.time :behind_time
      t.string :gender_dob
      t.string :forenames
      t.string :surnames
      t.string :not_used
      t.integer :num_splits

      t.timestamps
    end
  end
end
