# app/services/csv_importer.rb
require 'csv'

class CsvImporter
  def self.import(file_path)
    CSV.foreach(file_path, headers: true) do |row|
      RaceResult.create(
        race_number: row['RaceNumber'],
        card_number: row['CardNumbers'],
        membership_number: row['MembershipNumbers'],
        name: row['Name (Free Format)'],
        category: row['Category'],
        club: row['Club'],
        country: row['Country'],
        course_class: row['CourseClass'],
        start_time: row['StartTime'],
        finish_time: row['FinishTime'],
        race_time: row['RaceTime'],
        non_competitive: row['NonCompetitive'],
        position: row['Position'],
        status: row['Status'],
        handicap: row['Handicap'].to_i,
        penalty_score: row['PenaltyScore'].to_i,
        manual_score_adjust: row['ManualScoreAdjust'].to_i,
        final_score: row['FinalScore'].to_i,
        handicap_time: row['HandicapTime'],
        handicap_score: row['HandicapScore'].to_i,
        award_level: row['AwardLevel'],
        entry_system_ids: row['EntrySystemIDs'],
        eligibility: row['Eligibility'],
        journey_time: row['JourneyTime'],
        excluded_excess: row['ExcludedExcess'],
        behind_time: row['BehindTime'],
        gender_dob: row['GenderDOB'],
        forenames: row['Forenames'],
        surnames: row['Surnames'],
        not_used: row['NotUsed'],
        num_splits: row['NumSplits'].to_i
      )
    end
  end
end
