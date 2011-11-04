<%@ page contentType="text/javascript"%>

// Add a reference to the new plugin
CKEDITOR.plugins.addExternal('MediaEmbed',
'${request.contextPath}/js/ckeditor/plugins/mediaembed/');

CKEDITOR.editorConfig = function( config )
{
       // Declare the additional plugin
config.extraPlugins = 'MediaEmbed'; // Additional plugin

   // EXAMPLE TOOLBAR USING THE NEW PLUGIN
   config.toolbar_custom = [
       ['Templates',
'Styles','Format','Font','FontSize','TextColor','BGColor','Maximize','Image'],
       ['Source'],
       ['Bold','Italic','Underline','Strike','-','Subscript','Superscript','-','SpellChecker',
'Scayt'],
       ['Table','HorizontalRule'],
       ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
       ['MediaEmbed']
   ]
};