# Processing drawing

Processing is a java (or python) based drawing tool. Check it out on their website [www.processsing.org](https://www.processing.org).

## Setup with vscode

1. Download and extract processing from their official website [https://processing.org/download](https://processing.org/download).

2. Copy the file `template_tasks.json` (in root of project) to `.vscode/tasks.json`.

Or you can run : 
```bash
mkdir .vscode
cp .\template_tasks.json ./.vscode/tasks.json
```

3. Change value of the processing dir in `.vscode/tasks.json - line 11` to point on `processing-java.exe` (in your processing folder exctracted during step 1).

Example : `"command": "C:/Users/$USER/Documents/apps/processing-4.0b6-windows-x64/processing-4.0b6/processing-java.exe",`

4. Compile and run any `.pde` file using vscode tasks (`ctrl+shift+b` if unchanged).