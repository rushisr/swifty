using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Data.Odbc;

namespace SwiftyWCFServiceWebRole
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class SwiftyWebService : ISwiftyWebService
    {
        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public string GetNumber()
        {
            Random number = new Random();
            return "Welcome to Swifty! Your random number is :" + number.Next(1, 100).ToString();
        }

        public void AddUser(string userId, string emailId)
        {
            string dateNow = DateTime.UtcNow.ToString();
            string queryString =
              "INSERT INTO UserDetail (UserId, EmailId, LastLogIn, RegisteredTimestamp) Values('" + userId +"', '" + emailId +"', '" + dateNow + "', '" + dateNow+ "')";
            OdbcCommand command = new OdbcCommand(queryString);

            using (OdbcConnection connection = new OdbcConnection(ConnectionString))
            {
                command.Connection = connection;
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public UserInfo GetUser(string userId)
        {

            string queryString = "SELECT * FROM UserDetail WHERE UserId Like '" + userId + "'";
            using (OdbcConnection con = new OdbcConnection(ConnectionString))
            {
                con.Open();
                using (OdbcCommand cmd = new OdbcCommand(queryString, con))
                {
                    OdbcDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        UserInfo user = new UserInfo()
                        { 
                            UserId = reader.GetString(reader.GetOrdinal("UserId")),
                            EmailId = reader.GetString(reader.GetOrdinal("EmailId")), 
                            LastLogIn = reader.GetDateTime(reader.GetOrdinal("LastLogIn")),
                            RegisteredTimestamp = reader.GetDateTime(reader.GetOrdinal("RegisteredTimestamp"))
                        };

                        return user;
                    }
                }
            }

            return null;
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }

        private static string ConnectionString = "Driver={SQL Server Native Client 11.0};Server=tcp:waz1rfsf5w.database.windows.net,1433;Database=swifty_db;Uid=swiftyadmin@waz1rfsf5w;Pwd=pwd;Encrypt=yes;Connection Timeout=30;";
    }
}
