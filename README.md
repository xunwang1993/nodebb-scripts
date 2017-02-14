此项目收集了一些我写的 NodeBB 有关的脚本，供学习之用。如有问题或不明之处欢迎至V2MM上讨论。

# Backup Your NodeBB

backup-mongodb.js： 备份mongodb数据库，并保存zip文件至父目录；
backup-dir.js： 备份nodebb整个文件夹，并保存zip文件至父目录。

这两个脚本都需要带一个命令行参数，参数用于指定你的 nodebb 的路径。比如可以这样运行：

    node backup-mongodb.js ~/workspace/nodebb/
    node backup-dir.js ~/workspace/nodebb2/

运行完后zip压缩保存至你指定的目录的父目录。
此备份脚本改自 jongarrison 的 [nodebb-backup](https://github.com/jongarrison/nodebb-backup)，感谢他的工作。


# create-categories

这个脚本可以批量创建论坛categories, categories 定义于 data/ 下的 json 文件中。
~~效果见我的网站： https://letus.tech/category/5/concrete-mathematics, 右侧的那一颗长长的树就是批量创建的 category.~~
