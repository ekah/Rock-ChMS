
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by the Rock.CodeGeneration project
//     Changes to this file will be lost when the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------
//
// THIS WORK IS LICENSED UNDER A CREATIVE COMMONS ATTRIBUTION-NONCOMMERCIAL-
// SHAREALIKE 3.0 UNPORTED LICENSE:
// http://creativecommons.org/licenses/by-nc-sa/3.0/
//
using System.ComponentModel;
using System.ComponentModel.Composition;

namespace Rock.DataFilters.ServiceLog
{
    /// <summary>
    /// ServiceLog Property Filter
    /// </summary>
    [Description( "Filter Service Logs based on any ServiceLog property or attribute value" )]
    [Export( typeof( DataFilterComponent ) )]
    [ExportMetadata( "ComponentName", "ServiceLog Property Filter" )]
    public partial class ServiceLogPropertyFilter : PropertyFilter<Rock.Model.ServiceLog>
    {
    }
}