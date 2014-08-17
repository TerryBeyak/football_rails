( function($) {
  app = app || {};

  app.views.Pick = Backbone.View.extend({

    initialize: function(){
      
    },
    
    render: function() {
    },
          
  });

  app.views.Picks = Backbone.View.extend({

    el: "#picks-table",
    
    initialize: function() {
      this.presets = this.get_presets();
      this.preset = false;
    },

    events: {
      'click .radio-btn' : 'updateTotals',
    },
    
    updateTotals: function(e) {
      var self = this;
      this.reset_totals();

      var updates = [];
      var updates = _.clone(this.presets);

      _.each( $('.radio-btn:checked').parents('tr').children('td.pick'), function(pick) {
        
        var user = $(pick).data('user');
        var pick_value =  parseInt($(pick).text() ) ;

        updates[user] += pick_value;

      });
      _.each(updates, function(updated_total, index){
        $('[data-user-total="' +index+ '"]').text( updated_total );
      });

    },

    get_presets: function() {
      var presets = [];
      _.each( $('.user-total'), function(total) {
        presets[$(total).data('user-total')] = parseInt($(total).text());
      });
      return presets;
    },

    reset_totals: function() {
      var self = this;
      _.each(self.presets, function(value, index){
        $('[data-user-total="' +index+ '"]').text( value );
      });
    }

  });


})(jQuery);
