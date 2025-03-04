# データ収集用のDockerイメージをビルド
build-collector:
	docker build -t nook-collector -f Dockerfile.collector .

# データ収集を実行
collect:
	docker run -it --env-file .env -v $(pwd)/.output:/app/output nook-collector

# Webサーバー用のDockerイメージをビルド
build-viewer:
	docker build -t nook-viewer -f Dockerfile.viewer .

# Webサーバーを起動
viewer:
	docker run -it --env-file .env -v $(pwd)/.output:/app/output -p 8080:8080 nook-viewer
