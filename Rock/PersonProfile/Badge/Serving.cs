﻿//
// THIS WORK IS LICENSED UNDER A CREATIVE COMMONS ATTRIBUTION-NONCOMMERCIAL-
// SHAREALIKE 3.0 UNPORTED LICENSE:
// http://creativecommons.org/licenses/by-nc-sa/3.0/
//
using System.ComponentModel;
using System.ComponentModel.Composition;

using Rock.Model;

namespace Rock.PersonProfile.Badge
{
    // TODO: Update to return actual data

    /// <summary>
    /// Serving Badge
    /// </summary>
    [Description( "Serving Badge" )]
    [Export( typeof( BadgeComponent ) )]
    [ExportMetadata( "ComponentName", "Serving" )]
    public class Serving : IconBadge
    {
        /// <summary>
        /// Gets the attribute value defaults.
        /// </summary>
        /// <value>
        /// The attribute defaults.
        /// </value>
        public override System.Collections.Generic.Dictionary<string, string> AttributeValueDefaults
        {
            get
            {
                var defaults = base.AttributeValueDefaults;
                defaults["Order"] = "5";
                return defaults;
            }
        }

        /// <summary>
        /// Gets the tool tip text.
        /// </summary>
        /// <param name="person">The person.</param>
        /// <returns></returns>
        public override string GetToolTipText( Person person )
        {
            return "Currently serves in <br/>Neighborhood Group Leaders <br/> Children's Volunteers";
        }

        /// <summary>
        /// Gets the icon path.
        /// </summary>
        /// <param name="person">The person.</param>
        /// <returns></returns>
        public override string GetIconPath( Person person )
        {
            return string.Format( "{0}/Assets/Mockup/volunteer.jpg", System.Web.VirtualPathUtility.ToAbsolute( "~" ) );
        }
    }
}
