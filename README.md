# Prepare to remove Glacier Vault
GlacierのVaultを削除するのに中身（アーカイブ）を消す必要がある。
Vault削除準備のためのシェルです。

10TBほどのデータを格納してたが、消す必要があるので作り実行
かなり最適化したつもりだが、EC2（t2.medium）で実行しても2ヶ月ほどかかった。

# Usage
実行権限を与える。
```
$ chmod u+x *.sh
```

しばらく待つ（4時間位？）
Vaultの中身リストを作ってくれるみたい。
```
$ 1.initiate-job.sh
```

おわったかどうか確認
```
$ 2.check-inprogress.sh
```

2が終わっていたら、
中身（アーカイブ）をJSON化しているので、ダウンロードされる。
そして、archiveという名前のファイルにリスト化している。
```
$ 3.get-job-output.sh
```

中身（アーカイブ）を一つづつ消す作業が始まる。
300万行あったのでデーモン化して待つ。
```
$ cd <ボルトの名前>
$ 4.delete-archives.sh <ボルトの名前> &
```

delete-archives.sh でやっていることはGlacier Vaultへの削除*依頼*なので、check-archive-num.sh はすぐには反映されない。

終わったら、*アーカイブが0*になっていることを確認してVaultを消す。
```
$ ./check-archive-num.sh
$ tail -f <ボルトの名前>/log
```
