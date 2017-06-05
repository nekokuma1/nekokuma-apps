# nekokuma-apps


***

# Getting Started

|名前 |   コマンド    |
|-----  |   ----    |
|取得    |   go get github.com/dovneko/chaap|
|取得２  |   npm update|
|開発|npm start|
|デプロイ|npm dep|

***

# 整理中

## action creator（兼 dispatcher）
- アクションを提供する
- アクションはメッセージ発行する
    - 一つのアクションは複数のメッセージを発行する（dispatcher）
    - つまり複数のstoreに更新する
- 粒度はstoreの粒度とは異なる
    - ファイルは分割する（並行開発しやすいように）


- 例①　ShowList : Storeに必要な情報取得させる
- 例②　SetName : Storeにデータ変更を通知する

## store
- データ保持
    - apiからの取得を含む
- メッセージ受取
    - データ保存と操作
    - apiへの送信を含む
    - メッセージの定義（メッセージとストアは１：１）
- viewへのイベント通知

## view
- storeから一意な出力を行う
- ユーザーからの入力を受け付ける
    - アクションを行う