using MailKit.Net.Smtp;
using MailKit.Net.Pop3;
using MimeKit;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KontactKeepers
{
    // Should be public?
    public class EmailConf
    {
        private string emailAddressUName = "KontactKeeper@campus-kiosk.co.za";
        private string mailPass = "g4Ha2QtlMi7D";
        private string incomingSSLServer = "host21.axxesslocal.co.za";
        private string imapPort = "993";
        private string pop3Port = "995";
        private string outgoingServer = "host21.axxesslocal.co.za";
        private string smtpPort = "465";

        public string EmailAddressUName { get => emailAddressUName; set => emailAddressUName = value; }
        public string MailPass { get => mailPass; set => mailPass = value; }
        public string IncomingSSLServer { get => incomingSSLServer; set => incomingSSLServer = value; }
        public string ImapPort { get => imapPort; set => imapPort = value; }
        public string Pop3Port { get => pop3Port; set => pop3Port = value; }
        public string OutgoingServer { get => outgoingServer; set => outgoingServer = value; }
        public string SmtpPort { get => smtpPort; set => smtpPort = value; }

        public EmailConf()
        {
        }

        public void SendActivityEmail(string destAddress)
        {
            var messageToSend = new MimeMessage();

            messageToSend.Subject = "Account activity";
            BodyBuilder bb = new BodyBuilder();
            bb.HtmlBody = File.ReadAllText("index.html");
            messageToSend.Body = bb.ToMessageBody();
            messageToSend.From.Add(new MailboxAddress("KontactKeeper", emailAddressUName));
            messageToSend.To.Add(new MailboxAddress("Client", destAddress));

            using (var client = new SmtpClient())
            {
                client.Connect(outgoingServer, int.Parse(smtpPort), true);
                client.Authenticate(emailAddressUName, mailPass);
                client.Send(messageToSend);
                client.Disconnect(true);
            }
        }

        int partition(string[][] arr, int high, int low)
        {
            int pivot = int.Parse(arr[high][2]);
            int i = (low - 1);
            string[] tmp;
            for (int j = low; j < high; j++)
            {
                if (int.Parse(arr[j][2]) < pivot)
                {
                    i += 1;
                    tmp = arr[j];
                    arr[j] = arr[i];
                    arr[i] = tmp;
                }
            }
            tmp = arr[i + 1];
            arr[i + 1] = arr[high];
            arr[high] = tmp;
            return (i + 1);
        }

        void QuickSort(string[][] arr, int high, int low)
        {
            if (low < high)
            {
                int pi = partition(arr, high, low);
                QuickSort(arr, high, pi - 1);
                QuickSort(arr, pi + 1, low);
            }
        }

        public string RecieveActivity(string destAddress)
        {
            List<string[]> activityL = new List<string[]>();
            using (Pop3Client client = new Pop3Client())
            {
                client.Connect(incomingSSLServer, int.Parse(pop3Port), MailKit.Security.SecureSocketOptions.SslOnConnect, System.Threading.CancellationToken.None);
                client.Authenticate(emailAddressUName, mailPass);
                for (int i = 0; i < client.GetMessageCount(); i++)
                {
                    MimeMessage message = client.GetMessage(i);
                    foreach (MailboxAddress mailbox in message.From.Mailboxes)
                    {
                        if (mailbox.Address == destAddress)
                        {
                            activityL.Add(new string[] { mailbox.Address, message.Date.ToString(), string.Format("{0}", Math.Round((DateTime.Parse(DateTimeOffset.Now.ToString()) - DateTime.Parse(message.Date.ToString())).TotalDays)) });
                        }
                    }
                }
            }

            string[][] activityA = activityL.ToArray();
            QuickSort(activityA, activityA.Length - 1, 0);
            return activityA[activityA.Length - 1][1];
        }
    }
}