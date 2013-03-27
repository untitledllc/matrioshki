// Default empty project template
#ifndef Matrioshki_HPP_
#define Matrioshki_HPP_

#include <QObject>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class Matrioshki : public QObject
{
    Q_OBJECT
public:
    Matrioshki(bb::cascades::Application *app);
    virtual ~Matrioshki() {}
};


#endif /* Matrioshki_HPP_ */
