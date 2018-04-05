#ifdef __linux__
+    #include <unistd.h>
+    #include <sys/types.h>
+    #include <sys/stat.h>
+    #define LICENSE "LICENSE"
+    #define MAKEFILE "Makfile"
+#endif
+
+#ifdef __WIN32
+    #include <Windows.h>
+    #include <WinBase.h>
+
+    int createDirAndFilesWindows(char *languageType, char *projectName){
+        char currentDir[256];
+        GetCurrentDirectory(sizeof(currentDir), currentDir);
+        strcat(currentDir, "\\");
+        strcat(currentDir, projectName);
+
+        if(CreateDirectory(currentDir, NULL) == 0){
+            printf("Failed to create directory");
+            return 1;
+        }// TODO: Include details of failure 
+
+        // There is another proper way to do it :-)
+
+        char main[512];
+        char license[512];
+        char makefile[512];
+
+        strncpy(main, currentDir, sizeof(currentDir));
+        strncpy(license, currentDir, sizeof(currentDir));
+        strncpy(makefile, currentDir, sizeof(currentDir));
+
+        if (strcmp(languageType, "-C") == 0) {strcat(main, "\\main.c");}
+        else if (strcmp(languageType, "-Py") == 0) {strcat(main, "\\main.py");}
+        else if (strcmp(languageType, "-Latex") == 0) {strcat(main, "\\main.tex");}
+        else if (strcmp(languageType, "-CPP") == 0) {strcat(main, "\\main.cpp");}
+        else if (strcmp(languageType, "-C++")) {strcat(main, "\\main.cpp");}
+        else if (strcmp(languageType, "-BEAMER") == 0) {strcat(main, "\\main.tex");}
+        else strcat(main, "\\main");
