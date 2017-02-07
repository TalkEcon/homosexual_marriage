# homosexual_marriage
這裡放的是<誰支持同志婚姻？從出生世代與教育程度觀察>的相關檔案。
原文網址：
http://talkecon.com/homosexual_social_change/

檔案有 3 個文件夾，1個文字檔案，1個 csv 檔案，1個 R 檔案。

1.	文字檔案即本檔案，本檔案解釋其他檔案的用途。

2.	dofile 文件夾內包含 3 個檔案，都是用 Stata 13 可以執行的檔案。<br/> 如果您有下載台灣社會變遷調查的權限，<br/> 請參考下列載點：<br/> [1991第二期第二次：家庭、教育組](https://srda.sinica.edu.tw/group/sciitem/3/5) <br/>[2009第五期第五次：宗教組](https://srda.sinica.edu.tw/group/sciitem/3/191) <br/>[2012第六期第三次：性別組](https://srda.sinica.edu.tw/group/sciitem/3/1565) <br/>[2015第七期第一次：綜合問卷組](https://srda.sinica.edu.tw/group/sciitem/3/1954) <br/>以下3個檔案依次執行，便能得到本文中的圖片（Stata 的版本）。<br/>請注意，原始資料的檔案名稱與檔案路徑需要您在下面的檔案中自行編輯。另外，如果您使用 Stata 14，可能原始檔案會有亂碼，請參考下面這個網址處理。<br/> http://www.sciformosa.com.tw/Download/Stata/Stata14_OldVersionUnicode.pdf <br/>

 align_public：這個檔案從社會變遷調查歷年的原始資料中抓取本文需要的變數，並將不同年的資料合併在一起。<br/>
 data_clean_public：這個檔案把不合要求的資料刪除，並整理變數到我們想要的形式<br/>
 graph_public：這個檔案畫出本文的所有圖片。<br/>

3.	TalkEcon_誰支持同志婚姻編碼.csv 內紀錄了 arrange_public 與 data_clean_public 整理的變數名稱與變數編碼。

4.	如果您沒有社會變遷調查原始資料的權限，但仍想重製本文的圖片。graph_data 中的 4 個 csv 檔案分別代表了本文 5 張圖需要的資料。

5.	homo_marriage.R 的檔案可以幫您以 R 畫出本文的圖 3、圖 4-1、圖 4-2。畫圖的原始資料便是 graph_data 中的 graph_3、graph_4 兩個檔案。請自行設定 homo_marriage.R的檔案路徑。

6.	graph_public 文件夾中有本文所有圖片的 jpg 檔案。
