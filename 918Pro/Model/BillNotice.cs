﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Model
{
    [Serializable]
    public class BillNotice
    {
        public Int32 Id { get; set; }

        public String UserName { get; set; }

        public String Names { get; set; }

        public String Type { get; set; }

        public Decimal Amount { get; set; }
        public Decimal validamount { get; set; }

        public DateTime SubmitTime { get; set; }

        public DateTime UpdateTime { get; set; }

        public String Status { get; set; }

        public String Reasoncn { get; set; }

        public String Reasontw { get; set; }

        public String Reasonen { get; set; }

        public String Reasonvn { get; set; }

        public String Reasonth { get; set; }

        public Int32 BankID { get; set; }

        public String CardNo { get; set; }

        public String Bankcn { get; set; }

        public String Banktw { get; set; }

        public String Banken { get; set; }

        public String Bankth { get; set; }

        public String Bankaccount { get; set; }

        public String Bankno { get; set; }

        public String Currency { get; set; }

        public String BankTime { get; set; }

        public String Tel { get; set; }
        public String payType { get; set; }

        public String Mark { get; set; }
    }
}
