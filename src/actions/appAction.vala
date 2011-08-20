/* 
Copyright (c) 2011 by Simon Schneegans

This program is free software: you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the Free
Software Foundation, either version 3 of the License, or (at your option)
any later version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>. 
*/

namespace GnomePie {
    
// This type of Action launches an application or a custom command.

public class AppAction : Action {

    // the name of this group, as displayed in the gui
    public static string get_name() {
        return _("Launch application");
    }
    	
    public string command { get; set; }

    public AppAction(string name, string icon_name, string command) {
        base(name, icon_name);
        this.command = command;
    }

    public override void activate() {
        try{
            var item = GLib.AppInfo.create_from_commandline(this.command, null, GLib.AppInfoCreateFlags.NONE);
            item.launch(null, null);
    	} catch (Error e) {
	        warning(e.message);
        }
    } 
}

}