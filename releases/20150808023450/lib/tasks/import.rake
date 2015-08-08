require 'spreadsheet'

namespace :import do

  desc 'Import provinces to database'
  task :provinces => :environment do
    p 'Import provinces...'
    book = open_file
    if book
      province_worksheet = 0
      book.worksheet(province_worksheet).each_with_index do |row, index|
        next if index == 0
        Province.create(code: row[0], name: "#{row[2]} #{row[1]}", province_type: row[2])
      end
    else
      p 'Could not open file'
    end
  end

  desc 'Import districts to database'
  task :districts => :environment do
    p 'Import districts...'
    book = open_file

    if book
      district_worksheet = 1
      book.worksheet(district_worksheet).each_with_index do |row, index|
        next if index == 0
        province_code = row[4]
        province = Province.find_by(code: province_code)
        if province
          province.districts.create(code: row[0], name: "#{row[2]} #{row[1]}")
        else
          p "Can not find province with code #{province_code}"
        end
      end
    else
      p 'Could not open file'
    end
  end

  desc 'Import wards to database'
  task :wards => :environment do
    p 'Import wards...'
    book = open_file

    if book
      ward_worksheet = 2
      book.worksheet(ward_worksheet).each_with_index do |row, index|
        next if index == 0
        district_code = row[4]
        district = District.find_by(code: district_code)
        if district
          district.wards.create(code: row[0], name: "#{row[2]} #{row[1]}")
        else
          p "Can not find district with code #{district_code}"
        end
      end
    else
      p 'Could not open file'
    end
  end

  desc 'Import provinces, districts and wards to database'
  task :all => [:provinces, :districts, :wards]
end

# set default rake task with the same file name
task :import => 'import:all'

def open_file
  path = ENV['path'] || File.join(Rails.root, 'db', 'data.xls')
  Spreadsheet.open(path) rescue false
end
