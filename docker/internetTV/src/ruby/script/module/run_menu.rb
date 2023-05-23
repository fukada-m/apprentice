# frozen_string_literal: true

# 選択された番号に対応するメソッドを実行します。
module RunMenu
  def run_menu1
    n = 1
    result = @conn.exec(@menu1_sql)
    puts 'エピソード視聴数トップ3を表示します。'
    result.each do |row|
      puts "#{n}位のエピソードは#{row['episode']}で、視聴数は#{row['views']}回です。"
      n += 1
    end
    false
  end

  def run_menu2
    n = 1
    result = @conn.exec(@menu2_sql)
    puts 'エピソード視聴数トップ3の詳細を表示します。'
    result.each do |row|
      puts "#{n}位のエピソードは#{row['title']}のシーズン#{row['season_num']}の
                #{row['episode_num']}話でエピソード名は#{row['episode']}で視聴数は#{row['views']}です。"
      n += 1
    end
    false
  end

  def run_menu3
    @time = ''
    result = @conn.exec(@menu3_sql)
    puts '本日の番組表を表示します。'
    result.each { |row| show_tv_program_list(row) }
    false
  end

  def run_menu4
    @time = ''
    result = @conn.exec(@menu4_sql)
    puts '今日から１週間分のドラマチャンネルの番組表を表示します。'
    result.each { |row| show_tv_program_list(row) }
    false
  end

  def run_menu5
    result = @conn.exec(@menu5_sql)

    puts '直近1週間に放送され、最も見られたエピソードトップ2を表示します。'
    result.each do |row|
      puts "「タイトル」#{row['episode']}「視聴数」#{row['views']}"
    end
    false
  end

  def run_menu6
    result = @conn.exec(@menu6_sql)
    puts 'ジャンルごとの視聴数がトップの番組と最大視聴数（複数のエピソードがある場合はその平均値）を表示します。'
    result.each do |row|
      puts "「ジャンル」#{row['genre']}「タイトル」#{row['title']}「最大視聴数」#{row['max_views'].to_i}回"
    end
    false
  end

  def show_tv_program_list(row)
    if @time == row['start_time']
      puts "#{row['episode_num']}話「エピソード名」#{row['episode']}「エピソード詳細」#{row['episode_detail']}"
    end
    return unless @time != row

    show_tv_program_list_detail(row)
  end

  def show_tv_program_list_detail(row)
    @time = row['start_time']
    puts "「チャンネル」 #{row['channel']} \n 「放送時間」#{row['start_time']} ~ #{row['end_time']}"
    puts "「タイトル」#{row['title']} シーズン#{row['season_num']}"
    puts "#{row['episode_num']}話「エピソード名」 #{row['episode']}「エピソード詳細」#{row['episode_detail']}"
  end
end
