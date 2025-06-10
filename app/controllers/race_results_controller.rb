require 'csv'

class RaceResultsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:reload]

  def reload
    # Retrieve the CSV content sent by Python
    csv_content = params[:csv_content]
    
    if csv_content.nil? || csv_content.empty?
      render json: { error: 'CSV content is missing or empty' }, status: :unprocessable_entity
      return
    end

    # Parse the CSV content
    begin
      csv_data = CSV.parse(csv_content, headers: true)
      update_race_results(csv_data)  # Update race results in memory
      render json: { message: 'CSV file reloaded successfully' }
    rescue => e
      render json: { error: "Error parsing CSV: #{e.message}" }, status: :unprocessable_entity
    end
  end

  def index
    # Fetch results from the database
    @results = RaceResult.all # Assuming you have a model storing the results in your database
  end

  private

  def update_race_results(csv_data)
    # Update the race results, either storing them in memory or saving to the database
    # Assuming you want to update existing records or create new ones as needed:
  
    csv_data.each do |row|
      # Validate required fields are present
      if row['Name (Free Format)'].blank? || row['StartTime'].blank? || row['FinishTime'].blank?
        Rails.logger.warn("Skipping row due to missing required fields: #{row.inspect}")
        next
      end
  
      # Find the existing race result by name and start time
      race_result = RaceResult.find_or_initialize_by(
        name: row['Name (Free Format)'],
        start_time: row['StartTime']
      )
  
      # Update or create the record
      race_result.assign_attributes(
        finish_time: row['FinishTime'],
        position: row['Position'],
        behind_time: row['BehindTime']
      )
  
      # Save the record (either creating or updating it)
      if race_result.save
        Rails.logger.info("Race result #{race_result.name} updated or created successfully.")
      else
        Rails.logger.error("Failed to save race result: #{race_result.errors.full_messages.join(', ')}")
      end
    end
  end
  
end
