/**
* ClassName: FileContentSearcher
* Purpose: This class will find specifed String in Filess Tab(ContentDocument)
* 
* 
**/
public class FileContentSearcher {
    
    
    public static List<String> searchFilesContainingString(String searchString){
        List<String> fileNamesHavingString=new List<String>();
        List<ContentDocument> textTypeDocuments=[Select id,Title,FileExtension from ContentDocument where fileType IN ('pdf', 'xml', 'TEXT')];
        for(ContentDocument cd: textTypeDocuments){
            
            String downloadURL=getDownloadUrl(cd.id);
            if(downloadAndSearchFileContent(downloadURL,searchString)){
                fileNamesHavingString.add(cd.Title+'.'+cd.FileExtension);
                
            }
            System.debug('fileNamesHavingString-->'+fileNamesHavingString);
        }    
        return fileNamesHavingString;
    }
    
    private static String getDownloadUrl(String fileID){
        String fileURL='/services/data/v37.0/connect/files/'+fileID;
        HTTP http=new HTTP();
        HTTPRequest req=new HTTPRequest();
        req.setHeader('Authorization','Bearer '+UserInfo.getSessionID());
        req.setHeader('Content-Type','application/json');
        req.setHeader('accept','application/json');
        req.setMethod('GET');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+fileURL);
        
        HttpResponse resp = http.send(req);
        System.debug('res from downloadURL->'+resp);
        System.debug('fileID-->'+fileID);
        String downloadUrl=(String)((Map<String,Object>)Json.deserializeUntyped(resp.getBody())).get('downloadUrl');
        System.debug('downloadUrl-->'+downloadUrl);      
        return downloadUrl;
        
    }
    
    private static boolean downloadAndSearchFileContent(String downloadUrl,String searchString){
        System.debug('downloadUrl-->'+downloadUrl+' <--searchString--> '+searchString);
        HTTP http=new HTTP();
        HTTPRequest req=new HTTPRequest();
        req.setHeader('Authorization','Bearer '+UserInfo.getSessionID());
        req.setHeader('Content-Type','application/json');
        req.setHeader('accept','application/json');
        req.setMethod('GET');
        req.setEndpoint(downloadUrl);
        
        HttpResponse resp = http.send(req);
        System.debug('Response-->'+resp);
        if(resp.getBody().containsIgnoreCase(searchString)){
            return true;            
        }
        return false;
        
    }
/*
 <apex:page standardController="CustomObject__c">
    
    <script src="/soap/ajax/35.0/connection.js" type="text/javascript"></script>
    
    <script src="/soap/ajax/35.0/apex.js" type="text/javascript"></script>
    
    <script type="text/javascript" src="/jslibrary/SessionServer202.js"></script>
    
    <apex:form enctype="multipart/form-data">
        
        <style>
        
        html, body { width: 100%; height: 100%; overflow-y: hidden; padding: 0; margin: 0; }
    
    body { font: 13px Helvetica,sans-serif; }
    
    body > div { width: 100%; height: 100%; overflow-y: auto; display: inline-block; vertical-align: top; }
    
    iframe { border: none; width: 100%; height: 100%; }
    
    #output { padding: 10px; box-shadow: 0 0 5px #777; border-radius: 5px; margin: 10px; }
    
    #processor { height: 70px; display:none; }
    
    #input { display:none;}
    
    #inprogress { display:none; float:left; padding-left:25px; padding-top:0px; }
    
    .inputfield { float:left; }
    
    </style>
    
    <body>
        
        <div><br />
        
       <!-- embed the pdftotext web app as an iframe -->
            
            <iframe id="processor" src="{!URLFOR($Resource.pdf_upload, 'pdfbackend.html')}"></iframe>
            
            <div class="iputfield"><input id="file-input" type="file" name="file" accept=".pdf" onchange ="checkFile()"/>
                
                <input type="button" value="Upload" onclick="fileExtension();" /> </div>
                
                <div id="inprogress"><apex:image url="{!$Resource.loader}"/></div><br />
                    
                    <div id="myProgress"><div id="myBar"></div></div>
                        
                        </div>
                    
                    </body>
                    
                    <script type ="text/javascript">
                        
                        var sFileExtension;
    
    document.getElementById('file-input').addEventListener('change', checkFile, false);
    
    function checkFile(e) {
        
        /// get list of files
        
        var file_list = e.target.files;
        
        
        
        /// go through the list of files
        
        for (var i = 0, file; file = file_list[i]; i++) {
            
            var sFileName = file.name;
            
            sFileExtension = sFileName.split('.')[sFileName.split('.').length – 1].toLowerCase();
            
            var iFileSize = file.size;
            
            var iConvert = (file.size / 1048576).toFixed(2);
            
            
            
            /// OR together the accepted extensions and NOT it. Then OR the size cond.
            
            
            
            /// It’s easier to see this way, but just a suggestion – no requirement.
            
            if (!(sFileExtension === “pdf” ) || iFileSize > 1048576 ) { /// 1 mb
                
                txt = “File type : ” + sFileExtension + “\n\n”;
                
                txt += “Size: ” + iConvert + ” MB \n\n”;
                
                txt += “Please slect pdf with less than 1 MB.\n\n”;
                
                alert(txt);
                
                file =””;
                
            }
            
        }
        
    }
    
    var __sfdcSessionId = ‘{!GETSESSIONID()}’;
    
    var ContentVersion ;
    
    function fileExtension() {
        
        if (sFileExtension === “pdf”) {
            
            onReady();
            
        } else {
            
            alert(‘Please select pdf document ‘);
            
        }
        
    }
    
    function onReady() {
        
        window.addEventListener(“message”, function(event){
            
            updateCandidate(event.data.replace(/\s+/g, ” “))
            
        });
        
        readpdf();
        
        uploadFile();
        
    }
    
    function readpdf() {
        
        var reader = new FileReader();
        
        reader.onload = function(){
            
            processor.contentWindow.postMessage(reader.result, “*”);
            
        }
        
        reader.onprogress = function(data) {
            
            document.getElementById(“inprogress”).style.display = ‘block’;
            
        }
        
        reader.readAsArrayBuffer(document.getElementById(“file-input”).files[0]);
        
    }
    
    function uploadFile() {
        
        var input = document.getElementById(‘file-input’);
        
        var parentId = ‘{!CustomObject__c.Id}’;
        
        var filesToUpload = input.files;
        
        for(var i = 0, f; f = filesToUpload[i]; i++) {
            
            var reader = new FileReader();
            
            // Keep a reference to the File in the FileReader so it can be accessed in callbacks
            
            reader.file = f;
            
            /// creating salesforce file
            
            reader.onload = function(e) {
                
                var NewContentVersion = new sforce.SObject(“ContentVersion”);
                
                NewContentVersion.Title = ‘{!CustomObject__c.Name}’+’`s-Profile’;
                
                NewContentVersion.PathOnClient = ‘/’ + this.file.name;
                
                NewContentVersion.VersionData = (new sforce.Base64Binary(e.target.result)).toString();
                
                NewContentVersion.Origin = ‘H’;
                
                var result = sforce.connection.create([NewContentVersion]);
                
            };
            
            reader.readAsBinaryString(f);
            
        };
        
    }
    
    ///Updating custom object field with the text
    
    function updateCandidate(profileContent) {
        
        var CustomObject__c = new sforce.SObject(“CustomObject__c”);
        
        CustomObject__c.ID = ‘{!CustomObject__c.Id}’;
        
        CustomObject__c.Custom_Field__c = profileContent;
        
        var result =sforce.connection.update([CustomObject__c]);
        
        if (result[0].getBoolean(“success”)) {
            
            console.log(“CustomObject with id ” + result[0].id + ” updated”);
            
            alert (‘New Document is Uploaded Successfully’);
            
            window.top.location=’/{!CustomObject__c.id}’;
            
        } else {
            
            alert ('Document is Not Uploaded');
            
        }
        
    }
    
    </script>
    
</apex:form>

</apex:page>


 */    
}