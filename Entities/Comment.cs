//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TechnoservisApp.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class Comment
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public int MasterId { get; set; }
        public int RequestId { get; set; }
    
        public virtual RepairingRequest RepairingRequest { get; set; }
        public virtual User User { get; set; }
    }
}
