require "csv"

puts "1(新規でメモを作成) 2(既存のメモ編集する)"

memo_type = gets.to_i   #キーボードで入力した数値を受付

if memo_type == 1
    puts "拡張子を除いたファイル名を入力してください"
    file_name = gets.chomp   #ファイル名を受付

    puts "メモしたい内容を記入してください"
    puts "終了後、Ctrl + Dを押します"

    memo = STDIN.readlines  #標準入力でキーボードからの入力を受付。複数行の文字列を１行ごとの配列として取得

    CSV.open("#{file_name}.csv","w") do |csv|
        csv << ["#{memo}"]   #csvにmemoとして入力した文字列を出力
    end
    
elsif memo_type == 2
    puts "既存のファイル名を入力してください"
    file_name = gets.chomp
    puts "編集内容を入力してください"
    puts "終了後、Ctrl + Dを押します"

    memo = STDIN.readlines
    CSV.open("#{file_name}.csv","a") do |csv|
        csv << ["#{memo}"]
    end

end