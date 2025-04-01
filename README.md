# devops-docker
<p> Here we are dockerizing a html css js based project </p>

#Some explanations in this project:

Sure! Let's break it down step by step in a simple way:  

---

### **1. `FROM nginx:1.25.2`**  
- This tells Docker to **use the official Nginx image (version 1.25.2)** as the base for our container.  
- It means we are starting with Nginx already installed inside the container.  

---

### **2. `LABEL maintainer="Sujata Pati"`**  

---

### **3. `COPY nginx.conf /etc/nginx/nginx.conf`**  
- Copies our custom `nginx.conf` file from our local machine (where the Dockerfile is) **into the container’s** Nginx configuration directory (`/etc/nginx/`).  
- This **replaces the default Nginx settings** with our own configuration.  

---

### **4. `WORKDIR /usr/share/nginx/html`**  
- This sets the **default working directory inside the container** to `/usr/share/nginx/html`.  
- It means that any following commands (like `COPY`) will **run inside this folder by default**.  

---

### **5. `COPY index.html .`**  
- Copies `index.html` from our local machine **into the current working directory inside the container** (`/usr/share/nginx/html`).  
- The `.` means **"copy to the current directory"**.  

### **6. `COPY styles.css .`**  
- Copies `styles.css` into the same directory (`/usr/share/nginx/html`).  

### **7. `COPY scripts.js .`**  
- Copies `scripts.js` into the same directory.  

**Why?**  
✅ This makes sure our website files (HTML, CSS, JavaScript) are inside the Nginx web root so they can be served.  

---

### **8. `EXPOSE 80`**  
- This tells Docker that the container **will use port 80** (the default HTTP port).  
- This allows us to access the Nginx web server through `http://localhost` or `http://<container-ip>:80`.  

---

### **9. `CMD ["nginx", "-g", "daemon off;"]`**  
- This **starts the Nginx server** when the container runs.  
- `daemon off;` means "keep Nginx running in the foreground" instead of running in the background.  
- If we **don’t include this line, the container will start and immediately stop** because it has no process running.  

---

### **What Does This Dockerfile Do?**  
1. Starts with an official Nginx image.  
2. Copies a custom Nginx configuration.  
3. Copies website files (HTML, CSS, JS) into the correct folder.  
4. Opens port 80 for web access.  
5. Runs Nginx in the foreground.  

Now, when you **run the container**, it will serve our website using Nginx! 🚀  

Happy Learning 😊



##Nginx file explained:

Sure! Let's break this **Nginx configuration** into simple parts:  

---

### **1. `server { ... }`**  
- This defines a **server block**, which is like a "rule set" for handling web requests.  
- Nginx can have **multiple server blocks**, each handling different websites or domains.  

---

### **2. `listen 80;`**  
- This tells Nginx to **listen for incoming web requests on port 80** (the default HTTP port).  
- If someone types `http://test.local`, Nginx will respond.  

---

### **3. `server_name test.local;`**  
- This defines the **domain name** or **hostname** that this server block will handle.  
- Here, it’s set to `test.local`, so Nginx will respond when you visit `http://test.local`.  
- If you want this to work on your local machine, you need to add this entry to your **hosts file**:  
  ```
  127.0.0.1   test.local
  ```
  This makes your computer treat `test.local` as if it's hosted on your own machine.  

---

### **4. `root /usr/share/nginx/html;`**  
- This tells Nginx where to **look for website files** (HTML, CSS, JavaScript, images, etc.).  
- The folder `/usr/share/nginx/html` is **Nginx’s default root directory** inside the container.  
- When someone visits `http://test.local`, Nginx will serve files from this folder.  

---

### **5. `index index.html;`**  
- This tells Nginx that when a user **requests the root URL (`http://test.local/`)**, it should serve the `index.html` file.  
- If `index.html` doesn’t exist, Nginx will return an error.  

---

### **6. Logging: `access_log` & `error_log`**  
```nginx
access_log /var/log/nginx/access.log;
error_log /var/log/nginx/error.log;
```
- These lines tell Nginx to store logs:  
  - `access_log` records **all requests** made to the server (who visited, what page, etc.).  
  - `error_log` records **server errors** (like 404 errors or configuration issues).  
- These logs help **debug issues** when something isn’t working.  

---

### **7. `location / { try_files $uri $uri/ =404; }`**  
```nginx
location / {
    try_files $uri $uri/ =404;
}
```
- This handles requests for different pages/files.  
- `$uri` represents the **requested file or path** (e.g., `/about.html`).  
- `try_files $uri $uri/ =404;` means:  
  1. **Check if the file exists** (`$uri`).  
  2. **Check if it's a directory** (`$uri/`).  
  3. **If neither exists, return a 404 error** (file not found).  

🔹 **Example:**  
- If a user visits `http://test.local/home.html`, Nginx will check if `home.html` exists.  
- If it doesn’t, Nginx returns **404 Not Found**.  

---

### **Summary of What This Nginx Config Does:**  
✅ Listens on **port 80** for HTTP requests.  
✅ Handles requests for the **domain `test.local`**.  
✅ Serves files from **`/usr/share/nginx/html`**.  
✅ Uses **`index.html`** as the homepage.  
✅ Logs **access and errors** for debugging.  
✅ Ensures only existing files are served; otherwise, returns **404**.  

Happy Learning Day 1 😊🚀