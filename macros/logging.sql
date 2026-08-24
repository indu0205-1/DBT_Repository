{% macro learn_logging() %}

    {{ log("Call you mom!") }}
    {{ log("Call you dad!", info=true) }} {# Logs to the screen, too #}
    --{{ log("Call you dad!", info=true) }} {# This will be logged to the screen #}
    {# log("Call you dad!", info=true) #} {# This won't be executed #}

{% endmacro %}