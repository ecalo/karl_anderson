<%@ Page Title="File Upload" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="UploadFile.aspx.vb" Inherits="UploadFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type="text/javascript">
        $(function () {
            var sessionid,
                last_logid = 0,
                interval,
                trackNow;

            $('#simulate_submission').click(function () {
                var result = $.ajax({
                    type: "POST",
                    url: "WebService.asmx/Upload",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        msg = $.parseJSON(msg.d);
                        $('#message_area').prepend('<div style="padding:5px;margin:2px;"><span style="padding:5px;width:50px;color:red">' + getTimeStamp() + '</span><span>' + msg.message + '</span></div>');
                        sessionid = msg.sessionid;
                        interval = setInterval(trackNow, 5000);
                    },
                    failure: function (msg) {
                        alert(msg);
                    },
                    error: function (xhr, err) {
                        alert(err);
                    }
                });
                $('#loader').show();
            });
            trackNow = function () {
                var result = $.ajax({
                    type: "POST",
                    url: "WebService.asmx/ProcessTracker",
                    data: '{sessionid:"' + sessionid + '",lastlogid:' + last_logid + '}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (msg) {
                        var i = 0,
                            statuses = [];
                        msg = $.parseJSON(msg.d);
                        if (msg.last_log_id) {
                            last_logid = msg.last_log_id;
                            statuses = msg.detailed_statuses;
                            for (; i < statuses.length; i++)
                                $('#message_area').prepend('<div style="padding:5px;margin:2px;"><span style="padding:5px;width:50px;color:red">' + getTimeStamp() + '</span><span>' + statuses[i].status + '</span></div>');
                        }
                        if (msg.status == "SUCCESSFUL") {
                            $('#message_area').prepend('<div style="padding:5px;margin:2px;"><span style="padding:5px;width:50px;color:red">' + getTimeStamp() + '</span><span style="color:green;">Records have been successfully processed in ' + msg.total_process_time + '.</span></div>');
                            clearInterval(interval);
                            interval = false;
                            $('#loader').hide();
                        }

                    },
                    failure: function (msg) {
                        alert(msg);
                    },
                    error: function (xhr, err) {
                        alert(err);
                    }
                });
            }
        });
        function getTimeStamp(){
            var now = new Date();
            return [[AddZero(now.getDate()), AddZero(now.getMonth() + 1), now.getFullYear()].join("/"), [AddZero(now.getHours()), AddZero(now.getMinutes()), AddZero(now.getSeconds())].join(":"), now.getHours() >= 12 ? "PM" : "AM"].join(" ");
        }
        function AddZero(num) {
            return (num >= 0 && num < 10) ? "0" + num : num + "";
        }
    </script>
    <div style="position:relative">
        <button type="button" id="simulate_submission" style="margin:1em 0; padding:1em;">Simulate Submission</button>
        <img id="loader" src="images/loadingAnimation.gif" style="display:none;position: absolute;top: 5.6em;left: 1em;"/>
        <div id="message_area" style="padding-top:1em;width:99%;height:300px;border:1px solid #CCCCCC;overflow:auto"></div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
</asp:Content>

