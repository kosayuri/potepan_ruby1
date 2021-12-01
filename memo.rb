require "csv"
 
    puts "1(新規でメモを作成) 2(既存のメモ編集する)"
 
    memo_type = gets.chomp.to_s
 
    if memo_type=="1" then
        puts "拡張子を除いたファイルを入力してください"
        file_name = gets.chomp.to_s
        puts "メモしたい内容を記入してください"
        puts "完了したらCtrl+Dをおします"
        texts=readlines.map &:chomp

        begin
            CSV.open("#{file_name}.csv",'w',:quote_char =>'') do |fail_text|
                fail_text << texts
            end
            puts "保存に成功しました"
        rescue
            puts "保存に失敗しました"
        end

    elsif memo_type=="2" then
        puts "編集したい拡張子を除いたファイルを入力してください"
        file_name = gets.chomp.to_s
        puts "メモの内容"

        CSV.foreach("#{file_name}.csv") do |row|
            puts row
        end

        puts "追記したい内容を記入してください"
        puts "完了したらCtrl+Dをおします"
        texts=readlines.map &:chomp

        begin
            CSV.open("#{file_name}.csv",'a',:quote_char =>'') do |fail_text|
                fail_text << texts
            end
            puts "保存に成功しました"
        rescue
            puts "保存に失敗しました"
        end
        
    else
        puts "番号が違います"
    end
