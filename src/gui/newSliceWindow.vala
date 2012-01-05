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

/////////////////////////////////////////////////////////////////////////    
/// A window which allows selection of an Icon of the user's current icon 
/// theme. Custom icons/images can be selested as well. Loading of icons
/// happens in an extra thread and a spinner is displayed while loading.
/////////////////////////////////////////////////////////////////////////

public class NewSliceWindow : GLib.Object {

    private SliceTypeList slice_type_list = null;
    
    private Gtk.Window window = null;
    
    public NewSliceWindow() {
        try {
        
            Gtk.Builder builder = new Gtk.Builder();

            builder.add_from_file (Paths.ui_files + "/slice_select.ui");
            
            this.slice_type_list = new SliceTypeList();
            
            var scroll_area = builder.get_object("slice-scrolledwindow") as Gtk.ScrolledWindow;
                scroll_area.add(this.slice_type_list);

            this.window = builder.get_object("window") as Gtk.Window;
            
            (builder.get_object("ok-button") as Gtk.Button).clicked.connect(on_ok_button_clicked);
            (builder.get_object("cancel-button") as Gtk.Button).clicked.connect(on_cancel_button_clicked);
                
        } catch (GLib.Error e) {
            error("Could not load UI: %s\n", e.message);
        }
    }
    
    public void set_parent(Gtk.Window parent) {
        this.window.set_transient_for(parent);
    }
    
    public void show() {
        this.window.show_all();
    }
    
    private void on_ok_button_clicked() {
        this.window.hide();
    }
    
    private void on_cancel_button_clicked() {
        this.window.hide();
    }    
}

}
