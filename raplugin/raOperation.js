    var CryptoAgent = "";
    //加载ra插件
    function OnLoad() {
        if (navigator.appName.indexOf("Internet") >= 0 || navigator.appVersion.indexOf("Trident") >= 0) {
            if (window.navigator.cpuClass == "x86") {
                document.getElementById("FakeCryptoAgent").innerHTML = "<object id=\"CryptoAgent\" codebase=\"CryptoKit.CertEnrollment.UD.x86.cab\" classid=\"clsid:049A930E-C769-4AEA-87F8-0FFEA7849487\" ></object>";
            }
            else {
                document.getElementById("FakeCryptoAgent").innerHTML = "<object id=\"CryptoAgent\" codebase=\"CryptoKit.CertEnrollment.UD.x64.cab\" classid=\"clsid:F43C0DCD-E0DA-4194-BF62-3A452FD57105\" ></object>";
            }
        }
        else {
            document.getElementById("FakeCryptoAgent").innerHTML = "<embed id=\"CryptoAgent\" type=\"application/npCryptoKit.CertEnrollment.UD.x86\" style=\"height: 0px; width: 0px\">";
        }
       // var KenAlgorithm = document.getElementById("KenAlgorithm");
       // KenAlgorithm[0].selected = "selected";
       // KenAlgorithm[1].selected = "";
       // document.getElementById("tr_DigestAlgorithm").style.display = "block";
        CryptoAgent = document.getElementById("CryptoAgent");
    }
 
    function GetSelectedItemIndex(itemName) {
        var ele = document.getElementsByName(itemName);
        for (var i = 0; i < ele.length; i++) {
            if (ele[i].checked) {
                return i;
            }
        }
    }
 
    function GetSelectedItemValue(itemName) {
        var ele = document.getElementsByName(itemName);
        for (var i = 0; i < ele.length; i++) {
            if (ele[i].checked) {
                return ele[i].value;
            }
        }
    }
 
    function GetSelectedItemValue(itemName) {
        var ele = document.getElementsByName(itemName);
        for (var i = 0; i < ele.length; i++) {
            if (ele[i].checked) {
                return ele[i].value;
            }
        }
    }
    
    function FindProvider() {
        try {
            indexEnhanced = 0;
            var cryptprov = document.getElementById("TextCSPName");
 
            for (var i = 0; i < cryptprov.length; i++) {
                cryptprov.remove(i);
            }
            var cspInfo = CryptoAgent.CFCA_GetCSPInfo();
            if (!cspInfo) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var csps = cspInfo.split("||");
 
            if (cspInfo.indexOf('Microsoft Enhanced Cryptographic Provider v1.0') != -1) {
                var opt = document.createElement("OPTION");
                opt.value = "Microsoft Enhanced Cryptographic Provider v1.0";
                opt.text = "Microsoft Enhanced Cryptographic Provider v1.0";
                cryptprov.options.add(opt);
            }
 
            for (var i = 0; i < csps.length; i++) {
                if ((-1 == csps[i].indexOf("Microsoft"))) {
                    var opt = document.createElement("OPTION");
                    opt.value = csps[i];
                    opt.text = csps[i];
                    cryptprov.options.add(opt);
                }
            }
 
            cryptprov.selectedIndex = indexEnhanced;
        } catch (e) {
            var lastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            if (!(-1 == lastErrorDesc.indexOf("0x00000000"))) {
                alert(e.number + e.message);
            } else {
                alert(lastErrorDesc);
            }
        }
    }
 
    function VerifyCertificateIntegrity() {
        try {
            var result = CryptoAgent.CFCA_CheckCertificateChain();
            if (!result) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            alert("证书链完整");
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }
 
    function GetCSPInfo() {
        try {
            var cspNames = CryptoAgent.CFCA_GetCSPInfo();
            if (!cspNames) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("textareaCSPInfo").value = cspNames;
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }
 
    function GetAllCertInfo() {
        try {
            var certInfo = CryptoAgent.CFCA_GetAllCertInfo();
            if (!certInfo) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("TextAllCertInfo").value = certInfo;
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(e + ": " + LastErrorDesc);
        }
    }
    function PKCS10Requisition_SingleCert() {
        try {
            var keyAlgorithm = document.getElementById("KenAlgorithm").value;
            var selectValue = document.getElementById("KenLength").value;
            var keyLength = 0;
            if (selectValue == "1024") {
                keyLength = 1024;
            } else if (selectValue == "2048") {
                keyLength = 2048;
            } else if (selectValue == "4096") {
                keyLength = 4096;
            } else {
                keyLength = 256;
            }
            var cspName = document.getElementById("TextCSPName").value;
            var strSubjectDN = document.getElementById("TextSubjectDN").value;
            var res1 = CryptoAgent.CFCA_SetCSPInfo(keyLength, cspName);
            if (!res1) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var res2 = CryptoAgent.CFCA_SetKeyAlgorithm(keyAlgorithm);
            if (!res2) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
 
            var pkcs10Requisition = 0;
            if (keyAlgorithm == "RSA") {
                var selectedIndex = GetSelectedItemIndex("radio_DigestAlgorithm");
                if (selectedIndex == 1) {
                    //RSA单证 md5 
                    pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisitionwithMD5(strSubjectDN, 1, 0);
                }
                else {
                    //RSA单证 sha1 
                    pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisition(strSubjectDN, 1, 0);
                }
            }
            else {
                //SM2单证
                pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisition(strSubjectDN, 1, 0);
            }
 
            if (!pkcs10Requisition) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("textareaP10RSASingleCert").value = pkcs10Requisition;
            var contianerName = CryptoAgent.CFCA_GetContainer();
            if (!contianerName) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("TextContianerName").value = contianerName;
            //...need to sent pkcs10 requisition to CA
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }
 
    function PKCS10Requisition_DoubleCert() {
        try {
            var keyAlgorithm = document.getElementById("KenAlgorithm").value;
            var selectValue = document.getElementById("KenLength").value;
            var keyLength = 0;
            if (selectValue == "1024") {
                keyLength = 1024;
            } else if (selectValue == "2048") {
                keyLength = 2048;
            } else if (selectValue == "4096") {
                keyLength = 4096;
            } else {
                keyLength = 256;
            }
            var cspName = document.getElementById("TextCSPName").value;
            var strSubjectDN = document.getElementById("TextSubjectDN").value;
            var res1 = CryptoAgent.CFCA_SetCSPInfo(keyLength, cspName);
            if (!res1) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var res2 = CryptoAgent.CFCA_SetKeyAlgorithm(keyAlgorithm);
            if (!res2) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
 
            //P10 生成
            var pkcs10Requisition = 0;
            if (keyAlgorithm == "RSA") {
                var selectedIndex = GetSelectedItemIndex("radio_DigestAlgorithm");
                if (selectedIndex == 1) {
                    //RSA双证 md5 
                    pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisitionwithMD5(strSubjectDN, 2, 0);
                }
                else {
                    //RSA双证 sha1 
                    pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisition(strSubjectDN, 2, 0);
                }
            }
            else {
                //SM2双证
                pkcs10Requisition = CryptoAgent.CFCA_PKCS10CertRequisition(strSubjectDN, 2, 0);
            }
            if (!pkcs10Requisition) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
 
            document.getElementById("textareaP10RSASingleCert").value = pkcs10Requisition;
            var contianerName = CryptoAgent.CFCA_GetContainer();
            if (!contianerName) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("TextContianerName").value = contianerName;
            //...need to sent pkcs10 requisition to CA
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }
 
    function KeyAlgorithm_onchange(selectedItemIndex) {
        try {
            var kenLength_select = document.getElementById("KenLength");
            var optionNum = document.getElementById("KenLength").length;
            //remove select's options
            for (var i = optionNum; i >= 0; i--) {
                kenLength_select.remove(i);
            }
 
            if (selectedItemIndex == 0) {
                //RSA
                //show digest algorithm
                document.getElementById("tr_DigestAlgorithm").style.display = "block";
 
                //key length
                var optionTag = document.createElement('option');
                optionTag.text = "1024";
                optionTag.value = "1024";
                kenLength_select.options.add(optionTag);
                optionTag = document.createElement('option');
                optionTag.text = "2048";
                optionTag.value = "2048";
                kenLength_select.options.add(optionTag);
                optionTag = document.createElement('option');
                optionTag.text = "4096";
                optionTag.value = "4096";
                kenLength_select.options.add(optionTag);
                document.getElementById("TextCSPName").value = "Microsoft Enhanced Cryptographic Provider v1.0";
            } else {
                //SM2			
                //hide digest algorithm
                document.getElementById("tr_DigestAlgorithm").style.display = "none";
 
                var optionTag = document.createElement('option');
                optionTag.text = "256";
                optionTag.value = "256";
                kenLength_select.options.add(optionTag);
                //document.getElementById("TextCSPName").value = "CIDC Cryptographic Service Provider v3.0.0";
            }
 
        } catch (e) {
            alert(e.number + e.message);
        }
    }
 
 
    function GetTempPublickey() {
        try {
            //申请RSA加密证书
            var keyAlgorithm = document.getElementById("KenAlgorithm").value;
            var selectValue = document.getElementById("KenLength").value;
            var keyLength = 0;
            if (selectValue == "1024") {
                keyLength = 1024;
            } else if (selectValue == "2048") {
                keyLength = 2048;
            } else if (selectValue == "4096") {
                keyLength = 4096;
            } else {
                keyLength = 256;
            }
            var cspName = document.getElementById("TextCSPName").value;
            var strSubjectDN = document.getElementById("TextSubjectDN").value;
            var res1 = CryptoAgent.CFCA_SetCSPInfo(keyLength, cspName);
            if (!res1) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var res2 = CryptoAgent.CFCA_SetKeyAlgorithm(keyAlgorithm);
            if (!res2) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var tmpPublicKey = CryptoAgent.CFCA_GetTempPublickey();
            if (!tmpPublicKey) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("textareaP10RSASingleCert").value = tmpPublicKey;
            var contianerName = CryptoAgent.CFCA_GetContainer();
            if (!contianerName) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            document.getElementById("TextContianerName").value = contianerName;
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
 
    }
 
    function VerifyGenerateKeyPairPermission() {
        try {
            var result = CryptoAgent.CFCA_HavePermissiontoGenerateKeyPair();
            if (result) {
                alert("您有权限生成密钥对");
            }
            else {
                alert("没有权限生成密钥对");
            }
 
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(LastErrorDesc);
        }
    }
 
    function InstallCert(certType) {
        try {
            var cspName = document.getElementById("TextCSPName").value;
            if (cspName == "") {
                alert("CSP名称为空");
                return;
            }
            var keyAlgorithm = document.getElementById("KenAlgorithm").value;
            if (keyAlgorithm == "") {
                alert("密钥生成算法为空");
                return;
            }
            var selectValue = document.getElementById("KenLength").value;
            var keyLength = 0;
            if (selectValue == "1024") {
                keyLength = 1024;
            } else if (selectValue == "2048") {
                keyLength = 2048;
            } else if (selectValue == "4096") {
                keyLength = 4096;
            } else if (selectValue == "256") {
                keyLength = 256;
            }
            else {
                alert("密钥长度错误：" + keyLength);
                return;
            }
            var hResult = CryptoAgent.CFCA_SetKeyAlgorithm(keyAlgorithm);
            if (!hResult) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var bResult = CryptoAgent.CFCA_SetCSPInfo(keyLength, cspName);
            if (!bResult) {
                var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(errorDesc);
                return;
            }
            var signCert = document.getElementById("textareaSignCert").value;
            if (signCert == "") {
                alert("签名公钥证书内容为空");
                return;
            }
 
            var containerName = document.getElementById("TextContianerName").value;
            if (containerName == "") {
                alert("密钥容器名称内容为空");
                return;
            }
 
            if (certType == 1) {
                //sign cert
                var bResult = CryptoAgent.CFCA_ImportSignCert(1, signCert, containerName);
                if (!bResult) {
                    var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                    alert(errorDesc);
                    return;
                }
                alert("单证书安装成功");
                return;
            }
            else {
                //double cert
                var encryptCert_PublickeyCert = document.getElementById("textareaEncryptCert_PublickeyCert").value;
                if (encryptCert_PublickeyCert == "") {
                    alert("加密证书公钥证书内容为空");
                    return;
                }
 
                var encryptCert_PrivateData = document.getElementById("textareaEncryptCert_PrivatekeyCert").value;
                if (encryptCert_PrivateData == "") {
                    alert("加密证书私钥数据为空");
                    return;
                }
 
                var bResult = CryptoAgent.CFCA_ImportSignCert(2, signCert, containerName);
                if (!bResult) {
                    var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                    alert(errorDesc);
                    return;
                }
                bResult = CryptoAgent.CFCA_ImportEncryptCert(encryptCert_PrivateData, encryptCert_PublickeyCert, containerName, 0x1 | 0x2);
                if (!bResult) {
                    var errorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                    alert(errorDesc);
                    return;
                }
                alert("双证书安装成功");
            }
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(e + ";" + LastErrorDesc);
            if (certType == 1)
                alert("单证书安装失败");
            else
                alert("双证书安装失败");
        }
    }
    //通过条件过滤证书
    function SelectSignCert() {
 
        //document.getElementById("SelectedCerDN").value = "";
        var SubjectDN = document.getElementById("idcard").value;
       // var IssuerDN = document.getElementById("IssuerDN").value;
        //var SN = document.getElementById("CertSN").value;
 
        try {
            var bstrCertDN = CryptoAgent.CFCA_SelectCertificate(SubjectDN, "", "");
            if ("" != bstrCertDN && "undefined" != bstrCertDN.value) {
                //alert(bstrCertDN);
            	var rev=SignPKCS7();
            	return rev;
            }
            else {
                var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                $( "#dialog" ).html("此功能需要U盾才可访问！如果未插入U盾，请先插入U盾再操作；如果没有U盾请联系管理员申请！");
    			$( "#dialog" ).dialog({
    				position:[event.x-100,event.y-100],
    				modal:true,
    				title:"提示"	
    			});
    			return false;
            }
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            $( "#dialog" ).html("此功能需要U盾才可访问！如果未插入U盾，请先插入U盾再操作；如果没有U盾请联系管理员申请！");
			$( "#dialog" ).dialog({
				position:[event.x-100,event.y-100],
				modal:true,
				title:"提示"	
			});
			return false;
        }
    }
 
    function GetSelectCertInfo() {
 
        var CertInfoType = GetSelectedItemValue("radio_InfoType");
        document.getElementById("SelectedCertInfo").value = "";
        try
        {
            var bstrCertInfo = CryptoAgent.CFCA_GetSelectCertInfo(CertInfoType);
            if ("undefined" != bstrCertInfo.value) {
                document.getElementById("SelectedCertInfo").value = bstrCertInfo;
            }
            else {
                var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                alert(e + ":" + LastErrorDesc);
            }
        }
        catch (e) {
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            alert(e + ":" + LastErrorDesc);
        }
    }
    //验证签名。
    function SignPKCS7() {
 
        var SignSource = document.getElementById("signdata").value;
        var DigestAlg = "SHA-1";
        var retv=true;
        try {
            var Signature = CryptoAgent.CFCA_SignMsgPKCS7(SignSource, DigestAlg, true);
            if ("undefined" != Signature.value) {
                //document.getElementById("Signature").value = Signature;
            	 $.ajax({
            		type:"POST",
            		url:"chattel/rsaVerify.html",
            		cache: false,
            		async:false, 
            		data: {signdata: Signature,signsource:SignSource, isAjax: Math.random()},
            		success: function(o) {
            			if(o==""){
            				retv= true;
            			}else if(o=="0"){
            				retv= true;
            				$( "#dialog" ).html("您使用的U盾将在30天内过期，请及时联系管理员更新！");
            				$( "#dialog" ).dialog({
            					position:[event.x-100,event.y-100],
            					modal:true,
            					title:"提示"	
            				});
            				
            			}else if(o=="1"||o=="2"){
            				retv= false;
            				$( "#dialog" ).html("您使用的U盾无效！");
            				$( "#dialog" ).dialog({
            					position:[event.x-100,event.y-100],
            					modal:true,
            					title:"提示"	
            				});
            			}else if(o=="3"){
            				retv= false;
            				$( "#dialog" ).html("您使用的U盾未下载证书！");
            				$( "#dialog" ).dialog({
            					position:[event.x-100,event.y-100],
            					modal:true,
            					title:"提示"	
            				});
            				
            			}else if(o=="4"){
            				retv= false;
            				$( "#dialog" ).html("您使用的U盾证书已冻结！");
            				$( "#dialog" ).dialog({
            					position:[event.x-100,event.y-100],
            					modal:true,
            					title:"提示"	
            				});
            				
            			}else if(o=="5"){
            				retv= false;
            				$( "#dialog" ).html("您使用的U盾证书已吊销！");
            				$( "#dialog" ).dialog({
            					position:[event.x-100,event.y-100],
            					modal:true,
            					title:"提示"	
            				});
            				
            			}
            		    },
            		error: function() {
            		    alert("call failed");
            		}
            	});
            }
            else {
            	retv= false;
                var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
                $( "#dialog" ).html(e + ":" + LastErrorDesc);
				$( "#dialog" ).dialog({
					position:[event.x-100,event.y-100],
					modal:true,
					title:"提示"	
				});
				
            }
        }
        catch (e) {
        	retv= false;
            var LastErrorDesc = CryptoAgent.CFCA_GetLastErrorDesc();
            $( "#dialog" ).html(e + ":" + LastErrorDesc);
			$( "#dialog" ).dialog({
				position:[event.x-100,event.y-100],
				modal:true,
				title:"提示"	
			});
			
        }
        return retv;
    }
