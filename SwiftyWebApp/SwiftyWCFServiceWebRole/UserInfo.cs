using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.Serialization;

namespace SwiftyWCFServiceWebRole
{

    public enum UserStatus
    {
        Active,
        InActive
    }

    [DataContract]
    public class UserInfo
    {
        [DataMember]
        public string UserId { get; set; }

        [DataMember]
        public string EmailId { get; set; }

        [DataMember]
        public DateTime RegisteredTimestamp { get; set; }

        [DataMember]
        public DateTime LastLogIn { get; set; }
    }
}
