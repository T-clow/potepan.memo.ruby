require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i 
# ユーザーの入力値を取得し、数字へ変換しています
# if文を使用して続きを作成していきましょう。
# 「memo_type」の値（1 or 2）によって処理を分岐させていきましょう。
if memo_type == 1
  puts "新規でメモを作成します。"
  puts "メモの内容を入力してください："
  memo_content = gets.chomp
  
   CSV.open("memos.csv", "a") do |csv|
    csv << [memo_content]
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
  puts "新しいメモの内容を入力してください:"
  new_memo_content = gets.chomp  

  memos[memo_number - 1][0] = new_memo_content

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
