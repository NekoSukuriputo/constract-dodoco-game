# Menggunakan image Nginx versi Alpine Linux yang sangat ringan
FROM nginx:alpine

# Memberikan label metadata (opsional)
LABEL maintainer="Dodoco Game Maintainer"
LABEL description="Container untuk menjalankan Game Dodoco (Construct 2 HTML5)"

# Menghapus file default nginx di dalam container
RUN rm -rf /usr/share/nginx/html/*

# Menyalin seluruh file dari direktori project saat ini ke dalam folder hosting Nginx
# Asumsinya struktur folder hasil export Construct 2 (index.html, c2runtime.js, dll) ada di root folder ini
COPY . /usr/share/nginx/html

# Mengatur permission agar Nginx bisa membaca file (penting untuk beberapa environment K8s)
RUN chmod -R 755 /usr/share/nginx/html

# Expose port 80 agar bisa diakses
EXPOSE 80

# Jalankan Nginx di foreground
CMD ["nginx", "-g", "daemon off;"]
