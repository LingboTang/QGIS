/**
 * This class contains context information for attribute editor widgets.
 * It will be passed to embedded widgets whenever this occurs (e.g. when
 * showing an embedded form due to relations)
 */

class QgsAttributeEditorContext
{
%TypeHeaderCode
#include "qgsattributeeditorcontext.h"
%End
  public:
    /**
     * Determines in which direction a relation was resolved.
     */
    enum RelationMode
    {
      Undefined,  //!< This context is not defined by a relation
      Multiple,   //!< When showing a list of features (e.g. houses as an embedded form in a district form)
      Single      //!< When showing a single feature (e.g. district information when looking at the form of a house)
    };

    enum FormMode
    {
      Embed,
      StandaloneDialog,
      Popup
    };

    QgsAttributeEditorContext();


    QgsAttributeEditorContext( const QgsAttributeEditorContext& parentContext, FormMode formMode );

    QgsAttributeEditorContext( const QgsAttributeEditorContext& parentContext, const QgsRelation& relation, RelationMode relationMode, FormMode formMode );

    void setDistanceArea( const QgsDistanceArea& distanceArea );

    void setVectorLayerTools( QgsVectorLayerTools* vlTools );
    const QgsVectorLayerTools* vectorLayerTools() const;

    void setRelation( const QgsRelation& relation, RelationMode mode );
    const QgsRelation& relation() const;
    RelationMode relationMode() const;

    FormMode formMode() const;

    const QgsAttributeEditorContext* parentContext() const;
};
