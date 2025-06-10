# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_07_093201) do
  create_table "race_results", force: :cascade do |t|
    t.integer "race_number"
    t.string "card_number"
    t.string "membership_number"
    t.string "name"
    t.string "category"
    t.string "club"
    t.string "country"
    t.string "course_class"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.time "race_time"
    t.string "non_competitive"
    t.integer "position"
    t.string "status"
    t.integer "handicap"
    t.integer "penalty_score"
    t.integer "manual_score_adjust"
    t.integer "final_score"
    t.time "handicap_time"
    t.integer "handicap_score"
    t.string "award_level"
    t.string "entry_system_ids"
    t.string "eligibility"
    t.time "journey_time"
    t.time "excluded_excess"
    t.time "behind_time"
    t.string "gender_dob"
    t.string "forenames"
    t.string "surnames"
    t.string "not_used"
    t.integer "num_splits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
