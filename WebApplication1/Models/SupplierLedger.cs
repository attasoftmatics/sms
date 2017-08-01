//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication1.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SupplierLedger
    {
        public int Id { get; set; }
        public Nullable<double> Amount { get; set; }
        public Nullable<System.DateTime> DatenTime { get; set; }
        public Nullable<bool> Type { get; set; }
        public string Comment { get; set; }
        public Nullable<int> FK_SupplierLedger_Supplier { get; set; }
        public Nullable<int> FK_SupplierLedger_PaymentMode { get; set; }
    
        public virtual PaymentMode PaymentMode { get; set; }
        public virtual Supplier Supplier { get; set; }
    }
}
