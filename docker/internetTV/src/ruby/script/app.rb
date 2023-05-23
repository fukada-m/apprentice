# frozen_string_literal: true

require 'pg'
require 'date'
require 'debug'
['module/connection_module', 'module/run_menu', 'menu'].each { |file| require_relative file }

# 実際に行う処理が記載されています。
class App
  include ConnectionModule
  include RunMenu

  def initialize
    @selected_num = 0
    @time = ''
    @conn = conn
    @menu = Menu.new
  end

  def start
    loop do
      disp_menu(@menu.menus)
      break if input_num

      decide_menu(@selected_num)
    end
    @conn.close
  end

  private

  def disp_menu(menus)
    menus.each { |menu| puts menu }
  end

  def input_num
    @selected_num = gets.chomp.to_i
    case @selected_num
    when 1, 2, 3, 4, 5, 6 then puts "#{@selected_num}番が選択されました。"
    when 99
      puts '終了します'
      true
    else
      puts '該当するメニューがありません'
    end
  end

  def decide_menu(num)
    case num
    when 1 then run_menu1
    when 2 then run_menu2
    when 3 then run_menu3
    when 4 then run_menu4
    when 5 then run_menu5
    when 6 then run_menu6
    end
  end
end
