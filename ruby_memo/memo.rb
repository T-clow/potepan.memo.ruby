require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 
# ユーザーの入力値を取得し、数字へ変換しています
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  
  puts "ファイル名を入力してください。"
  file_name= gets.chomp
  
  puts "新規でメモを作成します。"
  puts "メモの内容を入力してください："
  memo_content = gets.chomp
  
  puts "終了後、Ctrl + D　を押します。"
  
  memo = STDIN.read
  
   CSV.open("memos.csv", "a") do |csv|
    csv << [file_name,memo_content]
   end 
   
   puts "メモが保存されました。"
 else
   puts "誤りです。正しい番号を入力してください。"
end


if memo_type == 2
  puts "既存のメモを編集します。"
  
  puts "編集したいメモの番号を入力してください:"
  memos = CSV.read("memos.csv") 

  memos.each_with_index do |memo, index|
    puts "#{index + 1}: #{memo[0]}"
  end

  memo_number = gets.to_i 

if memo_number.between?(1, memos.length)
    selected_memo = memos[memo_number - 1]
    puts "ファイル名: #{selected_memo[0]}"
    puts "既存のメモ内容: #{selected_memo[1]}"

    puts "新しいファイル名を入力してください:"
    new_file_name = gets.chomp
    puts "新しいメモの内容を入力してください:"
    new_memo_content = gets.chomp
    puts "終了後、Ctrl + Dを押します."
    memo = STDIN.read
    
    selected_memo[0] = new_file_name
    selected_memo[1] = new_memo_content

  CSV.open("memos.csv", "w") do |csv|
    memos.each do |memo|
      csv << memo
    end
  end

  puts "メモが編集されました。"
else
  puts "無効なメモ番号です。"
end

end
