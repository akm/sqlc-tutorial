# sqlc-tutorial

## Setup

Install golang

```
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install
```

Launch docker desktop.

## Run

```
make db-setup run
```

<details><summary> make db-setup run </summary>

```
 make db-setup run
docker-compose up -d
[+] Running 2/2
 ✔ Network sqlc-tutorial_default    Created                                                                                                      0.0s
 ✔ Container sqlc-tutorial-mysql-1  Started                                                                                                      0.1s
sleep 1 && mysqladmin -u root -h 127.0.0.1 --wait --count 3 ping || exit 1
mysqld is alive
mysql -u root -h 127.0.0.1 sqlc-tutorial1 < schema.sql
go run .
2024/07/16 21:57:15 []
2024/07/16 21:57:15 1
2024/07/16 21:57:15 true
```

</details>
