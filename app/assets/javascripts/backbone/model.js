app = app || {};

app.models.Pick = Backbone.Model.extend({
  // defaults: {
  // }   
});

app.collections.Picks = Backbone.Collection.extend({

  initialize: function() {
  },

        
  model: app.models.Pick,

  url: '/seasons/1/weeks/1/picks.json'
        
});
