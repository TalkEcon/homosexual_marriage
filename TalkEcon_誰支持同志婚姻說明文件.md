# homosexual_marriage
這裡放的是<誰支持同志婚姻？從出生世代與教育程度觀察>的相關檔案。
原文網址：
http://talkecon.com/homosexual_social_change/

檔案有 3 個文件夾，1個文字檔案，1個 csv 檔案，1個 R 檔案。

1.	文字檔案即本檔案，本檔案解釋其他檔案的用途。

2.	dofile 文件夾內包含 3 個檔案，都是用 Stata 13 可以執行的檔案。如果您有下載台灣社會變遷調查的權限（https://srda.sinica.edu.tw/group/scigview/3/2），下載 1991（家庭、教育主題）、2009（宗教與文化主題）、2012（性別）、2015（綜合組）的原始資料後，以下3個檔案依次執行，便能得到本文中的圖片（Stata 的版本）。請注意，原始資料的檔案名稱與檔案路徑需要您在下面的檔案中自行編輯。另外，如果您使用 Stata 14，可能原始檔案會有亂碼，請參考下面這個網址處理。http://www.sciformosa.com.tw/Download/Stata/Stata14_OldVersionUnicode.pdf

#	align_public：這個檔案從社會變遷調查歷年的原始資料中抓取奔文需要的變數，並將不同年的資料合併在一起。
#	data_clean_public：這個檔案把不合要求的資料刪除，並整理變數到我們想要的形式
#	graph_public：這個檔案畫出本文的所有圖片。

3.	TalkEcon_誰支持同志婚姻編碼.csv 內紀錄了 arrange_public 與 data_clean_public 整理的變數名稱與變數編碼。

4.	如果您沒有社會變遷調查原始資料的權限，但仍想重製本文的圖片。graph_data 中的 5 個 csv 檔案分別代表了本文 5 張圖需要的資料。

5.	homo_marriage.R 的檔案可以幫您以 R 畫出本文的圖 3、圖 4-1、圖 4-2。畫圖的原始資料便是 graph_data 中的 graph_3、graph_4 兩個檔案。請自行設定 homo_marriage.R的檔案路徑。

6.	graph_public 文件夾中有本文所有圖片的 jpg 檔案。
