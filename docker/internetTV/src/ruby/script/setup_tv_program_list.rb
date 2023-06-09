# frozen_string_literal: true

require 'pg'
require_relative 'module/connection_module'

# 1週間分の番組表を作成します。
class SetupTvProgramList
  include ConnectionModule

  def initialize
    @conn = conn
  end

  def create_anime_program_list(date)
    result = @conn.exec('SELECT MAX(broadcast_time_id) FROM broadcast_times')
    id = result[0]['max'].to_i
    4.times do |n|
      title_num = rand(1..5)
      @conn.exec("INSERT INTO broadcast_times VALUES(
        #{id + n + 1}, '#{date} 0#{n * 6}:00:00', '#{date} 0#{(n + 1) * 6}:00:00')")
      @conn.exec("INSERT INTO tv_program_list VALUES ( #{id + n + 1} , 2, #{title_num} );")
    end
  end

  def create_drama_program_list(date)
    result = @conn.exec('SELECT MAX(broadcast_time_id) FROM broadcast_times')
    id = result[0]['max'].to_i
    2.times do |n|
      title_num = rand(6..9)
      @conn.exec("INSERT INTO broadcast_times VALUES(
         #{id + n + 1}, '#{date} 0#{n * 12}:00:00', '#{date} 0#{(n + 1) * 12}:00:00')")
      @conn.exec("INSERT INTO tv_program_list VALUES ( #{id + n + 1} , 1, #{title_num} );")
    end
  end

  def end_connect
    @conn.close
  end
end

setup_tv_program_list = SetupTvProgramList.new
(19..30).each do |i|
  setup_tv_program_list.create_anime_program_list("2023-05-#{i}")
  setup_tv_program_list.create_drama_program_list("2023-05-#{i}")
end
setup_tv_programList.end_connect
