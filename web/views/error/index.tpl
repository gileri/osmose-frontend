%rebase('layout.tpl', title=_("Information on issue %s") % uuid, favicon="../images/markers/marker-l-%s.png" % marker['item'])
%def show_html_dict(dict):
            <table>
%            for (k, v) in sorted(dict.items()):
                <tr><td>{{k}}</td><td>{{v}}</td></tr>
%            end
            </table>
%end
%def show_html_tags(list):
            <table>
%            for kv in list:
%               if 'v' in kv:
                    <tr><td>{{kv['k']}}</td><td>{{kv['v']}}</td><td><a href="{{kv.get('vlink', '')}}">{{kv.get('vlink', '')}}</a></td></tr>
%               else:
                    <tr><td>{{kv['k']}}</td></tr>
%               end
%            end
            </table>
%end
%def show_html_list(list):
            <table>
%            for e in list:
                <tr><td>
%    if type(e) is dict:
%        show_html_dict(e)
%    elif type(e) is list:
%        if len(e) > 0:
%            show_html_list(e)
%        end
%    else:
{{e}}
%    end
</td></tr>
%            end
            </table>
%end

<h2>{{_("Marker")}}</h2>
<table class="table table-striped table-bordered table-hover table-sm sortable" id ="table_marker">
<thead class="thead-dark">
<tr>
    <th scope="col">{{_("key")}}</th>
    <th scope="col">{{_("value")}}</th>
</tr>
</thead>
<tr><td>source</td><td><a target="_blank" href="../errors/?item=xxxx&amp;source={{marker['source_id']}}">{{marker['source_id']}}<a></td></tr>
<tr><td>item</td><td><a target="_blank" href="../errors/?item={{marker['item']}}">{{marker['item']}}</a></td></tr>
<tr><td>class</td><td><a target="_blank" href="../errors/?item={{marker['item']}}&amp;class={{marker['class']}}">{{marker['class']}}</a></td></tr>
<tr><td>lat lon</td><td><a target="_blank" href="../map/?item={{marker['item']}}&amp;zoom=17&amp;lat={{marker['lat']}}&amp;lon={{marker['lon']}}&amp;issue_uuid={{marker['uuid']}}">{{marker['lat']}}&nbsp;{{marker['lon']}}</a></td></tr>
<tr><td>title</td><td>
%show_html_dict(marker['title'])
</td></tr>
<tr><td>subtitle</td><td>
%show_html_dict(marker['subtitle'])
</td></tr>
<tr><td>timestamp</td><td>{{marker['timestamp']}}</td></tr>
%if marker['detail']:
<tr><td>detail</td><td>
%show_html_dict(marker['detail'])
</td>
%end
%if marker['fix']:
<tr><td>fix</td><td>
%show_html_dict(marker['fix'])
</td>
%end
%if marker['trap']:
<tr><td>trap</td><td>
%show_html_dict(marker['trap'])
</td>
%end
%if marker['example']:
<tr><td>example</td><td>
%show_html_dict(marker['example'])
</td>
%end
%if marker['source_code']:
<tr><td>source code</td><td><a href="{{marker['source_code']}}" target_="_blank">{{marker['source_code']}}</a></td>
%end
%if marker['resource']:
<tr><td>resource</td><td><a href="{{marker['resource']}}" target_="_blank">{{marker['resource']}}</a></td>
%end
</table>
</br>

<h2>{{_("Elements")}}</h2>
%for elem_index, element in enumerate(marker['elems'] or []):
<table class="table table-striped table-bordered table-hover table-sm sortable" id="table_marker">
<thead class="thead-dark">
<tr>
    <th scope="col">{{_("key")}}</th>
    <th scope="col">{{_("value")}}</th>
</tr>
</thead>
<tr><td>elem_index</td><td>{{elem_index}}</td></tr>
<tr><td>type id</td><td><a target="_blank" href="{{main_website}}{{data_type[element['type']]}}/{{element['id']}}">{{element['type']}}&nbsp;{{element['id']}}</a></td></tr>
<tr><td>tags</td><td>
%     show_html_tags(element['tags'])
</td></tr>
%    if 'username' in element:
<tr><td>username</td><td><a target="_blank" href="{{main_website}}user/{{element['username']}}">{{element['username']}}</a></td></tr>
%    end
</table>
</br>
%end

<h2>{{_("Fixes")}}</h2>
%for fix_index, fix_group in enumerate(marker['fixes'] or []):
<h3>{{"#{0}".format(fix_index)}}</h3>
%for fix in fix_group:
<table class="table table-striped table-bordered table-hover table-sm sortable" id="table_marker">
<thead class="thead-dark">
<tr>
    <th scope="col">{{_("key")}}</th>
    <th scope="col">{{_("value")}}</th>
</tr>
</thead>
<tr><td>fix_index</td><td>{{fix_index}}</td></tr>
<tr><td>type id</td><td><a target="_blank" href="{{main_website}}{{data_type[fix['type']]}}/{{fix['id']}}">{{fix['type']}}&nbsp;{{fix['id']}}</a></td></tr>
<tr><td>create</td><td>
%    show_html_tags(fix['create'])
</td></tr>
<tr><td>modify</td><td>
%    show_html_tags(fix['modify'])
</td></tr>
<tr><td>delete</td><td>
%    show_html_tags(fix['delete'])
</td></tr>
</table>
</br>
%end
%end
