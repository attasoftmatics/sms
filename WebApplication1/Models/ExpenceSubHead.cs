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
    
    public partial class ExpenceSubHead
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ExpenceSubHead()
        {
            this.Expences = new HashSet<Expence>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
        public Nullable<int> FK_ExpenceHead_ExpenceSubHead { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Expence> Expences { get; set; }
        public virtual ExpenceHead ExpenceHead { get; set; }
    }
}
